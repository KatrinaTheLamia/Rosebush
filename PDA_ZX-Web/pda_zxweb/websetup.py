"""Setup the PDA_ZX-Web application"""
import logging

from pda_zxweb.config.environment import load_environment
from pda_zxweb.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup pda_zxweb here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    meta.metadata.create_all(bind=meta.engine)
