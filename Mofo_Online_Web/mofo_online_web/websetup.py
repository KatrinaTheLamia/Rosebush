"""Setup the Mofo_Online_Web application"""
import logging

from mofo_online_web.config.environment import load_environment
from mofo_online_web.model import meta

log = logging.getLogger(__name__)

def setup_app(command, conf, vars):
    """Place any commands to setup mofo_online_web here"""
    load_environment(conf.global_conf, conf.local_conf)

    # Create the tables if they don't already exist
    meta.metadata.create_all(bind=meta.engine)
