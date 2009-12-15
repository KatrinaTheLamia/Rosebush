import logging

from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to

from rosebush.lib.base import BaseController, render

log = logging.getLogger(__name__)

class NewsController(BaseController):
    """REST Controller styled on the Atom Publishing Protocol"""
    # To properly map this controller, ensure your config/routing.py
    # file has a resource setup:
    #     map.resource('new', 'news')

    def index(self, format='html'):
        """GET /news: All items in the collection"""
        # url('news')

    def create(self):
        """POST /news: Create a new item"""
        # url('news')

    def new(self, format='html'):
        """GET /news/new: Form to create a new item"""
        # url('new_new')

    def update(self, id):
        """PUT /news/id: Update an existing item"""
        # Forms posted to this method should contain a hidden field:
        #    <input type="hidden" name="_method" value="PUT" />
        # Or using helpers:
        #    h.form(url('new', id=ID),
        #           method='put')
        # url('new', id=ID)

    def delete(self, id):
        """DELETE /news/id: Delete an existing item"""
        # Forms posted to this method should contain a hidden field:
        #    <input type="hidden" name="_method" value="DELETE" />
        # Or using helpers:
        #    h.form(url('new', id=ID),
        #           method='delete')
        # url('new', id=ID)

    def show(self, id, format='html'):
        """GET /news/id: Show a specific item"""
        # url('new', id=ID)

    def edit(self, id, format='html'):
        """GET /news/id/edit: Form to edit an existing item"""
        # url('edit_new', id=ID)
