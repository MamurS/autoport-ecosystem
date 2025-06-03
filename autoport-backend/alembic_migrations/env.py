from logging.config import fileConfig
import asyncio
import os
import sys
from sqlalchemy import pool
from sqlalchemy.ext.asyncio import async_engine_from_config
from alembic import context

# Add project root to Python path
project_root_directory = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
if project_root_directory not in sys.path:
    sys.path.insert(0, project_root_directory)

# Try to import with error handling
target_metadata = None

try:
    from database import Base
    # Import all your models to ensure they're registered
    import models.user
    import models.car  
    import models.trip
    import models.booking
    target_metadata = Base.metadata
    print("✅ Successfully imported database models")
except Exception as e:
    print(f"⚠️  Warning: Could not import models: {e}")
    print("Alembic will work but won't auto-detect schema changes")
    target_metadata = None

config = context.config

if config.config_file_name is not None:
    fileConfig(config.config_file_name)

def run_migrations_offline() -> None:
    """Run migrations in 'offline' mode."""
    url = config.get_main_option("sqlalchemy.url")
    context.configure(
        url=url,
        target_metadata=target_metadata,
        literal_binds=True,
        dialect_opts={"paramstyle": "named"},
        compare_type=True,
        compare_server_default=True,
    )

    with context.begin_transaction():
        context.run_migrations()

def do_run_migrations(connection):
    """Run migrations with database connection."""
    context.configure(
        connection=connection, 
        target_metadata=target_metadata,
        compare_type=True,
        compare_server_default=True,
    )

    with context.begin_transaction():
        context.run_migrations()

async def run_async_migrations():
    """Run async migrations."""
    connectable = async_engine_from_config(
        config.get_section(config.config_ini_section, {}),
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )

    async with connectable.connect() as connection:
        await connection.run_sync(do_run_migrations)

    await connectable.dispose()

def run_migrations_online() -> None:
    """Run migrations in 'online' mode."""
    asyncio.run(run_async_migrations())

if context.is_offline_mode():
    run_migrations_offline()
else:
    run_migrations_online()
