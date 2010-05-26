#!/dev/null
#= Contact.py
# Authors: [[KatrinaTheLamia_(user)]]
# Groups: [[NIMHLabs_(group)]]
# Projects: [[Rosebush_(software)]]
# Creation: 3176-2-73
# 
# In this file, '''Contact Information''' is covered for the database.
# Typically it is a simple based system that is stored based on user
# information here. The user is only really known as an id number, until
# the contact information is added.
#== Revisions
# {{created|Contact.py}}
#== Issues
# I think I am linking databases wrong.

import sqlalchemy as sa
import rosebush

metadata = sa.MetaData()

user_id = sa.Table('sessions',metadata
		"""
			contains the current session id, and a contact id.

			A special contact id is used for anonymous
		"""
		sa.Column('id',sa.Integer,primary_key=True),
		sa.Column('session_id_id',sa.Integer),
		sa.Column('contact_group_id',sa.Interger),
		)

user_contact = sa.Table('contact_group',metadata
		"""
			Just a contact group id, the "type" of contact, 

			And the contact information.

			Typically, this is only stuff you volunteer to the site.
		"""
		sa.Column('id',sa.Integer),
		sa.Column('type',rosebush.SQL.Clue),
		sa.Column('contact',rosebush.SQL.Contact),
		)

class Sessions(object):
	def __init__(self, sessions_id_id, contact_group_id):
		self.sessions_id_id = sessions_id_id
		self.contact_group_id = contact_group_id

	def __repr__(self):
		return "<Sessions('%s','%s')>" % (self.sessions_id_id, self.contact_group_id);

class User_Contact(object):
	def __init__(self,type,contact):
		self.type = type
		self.contact = contact

	def __repr__(self):
		return "<User_Contact('%s','%s')>" % (self.type, self,contact);

sa.orm.mapper(Sessions,user_id)
sa.orm.mapper(User_Contact,user_contact)
