"""addtable potato

Revision ID: 34cfbdb6ef62
Revises: 
Create Date: 2024-09-08 19:16:35.812748

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '34cfbdb6ef62'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        'potato',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('name', sa.String, nullable=False),

    )


def downgrade() -> None:
    op.drop_table('potato')