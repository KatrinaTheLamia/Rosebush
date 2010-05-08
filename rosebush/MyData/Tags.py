#!/bin/null
#= Tags.py
# Author: [[KatrinaTheLamia]]
# Group: [[NIMHLabs]]
# Creation: 3176-2-54
# Revisions:
# + 3176-2-54
# Purpose:
# Tagging system for Rosebush

import sqlalchemy as sa

metadata = sa.MetaData()

tags_table = sa.Table('tags', metadata,
		      sa.Column('tag', sa.String),
		      sa.Column('url', sa.Text),
		      )


class Tags(object):
	"""
		A simple tagging scheme. Tags are given as strings to 
		long text that is urls. Since a URL is possible to be 1023
		words in length, a varchar would not work, as it can only 
		handle a maximum of 255 words.

		(Words here is used to refer to a single unit in a charset.
		EBCDIC uses 8bit Words. ISO ASCII-7 uses 7bit.  ISO ASCII-8
		use 8bit. MS ASCII uses 8bit. Unicode will slide between 16bit
		to 8bit... in the cases where the character's first two
		digits are 00. So like 001C would be turned into an 8bit 1C.)

		The URL scheme will allow for nonrosebush links.

		For rosebush the schema is:

		protocal :== rosebush
		point_to_serve :== '://'
		path_serperator :== '/'
		server := FQDN | IP Address | FProxy_id
		locator_id := Interger
		locator_string := String
		locator_tag := String
		path := path_seperator + locator_id | path_seperator + \
				locator_string | path_seperator + \
				locator_tag | path + path

		rosebush_url :== rosebush + point_to_server + server? + path
	"""
	__init__(self, tag, url):
		self.tag = tag
		self.url = url


	__repr(self):
		return "<Tags('%s','%s')>" %(self.tag, self.url)


def add_engine(engine):
	metadata.create_all(engine)

sa.orm.mapper(Tags,tags_table)

if __name__ eq '__main__':
	"""
		standard test unit. Should not normally be ran due to gimp
		shebang
	"""
	engine = sa.create_engine('sql:///:memory:',echo=True)
	add_engine(engine)

