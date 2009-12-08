"""Setup the NIMH_Tv application"""
import logging

from nimh_tv.config.environment import load_environment
from nimh_tv.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup nimh_tv here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    meta.metadata.create_all(bind=meta.engine)
