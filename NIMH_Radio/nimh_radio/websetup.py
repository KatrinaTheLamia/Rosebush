"""Setup the NIMH_Radio application"""
import logging

from nimh_radio.config.environment import load_environment
from nimh_radio.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup nimh_radio here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    meta.metadata.create_all(bind=meta.engine)
