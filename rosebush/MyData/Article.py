#!/dev/null python
#= Article.Py
# Author: [[KatrinaTheLamia]]
# Group: [[NIMHLabs]]
# Creation: 3176-2-54
# Revisions:
# + 3176-2-54 File Creation
# Purpose:
# The article data base description file.

"""
	Kind of irritating dealing with files like this. There must be some
	way to stream line this process. As pretty much each of these files 
	are just varients and copies of the others.
"""


import sqlalchemy as sa

metadata = sa.MetaData()

article_locator_table = sa.Table('article_locator', metadata,
		         sa.Column('id', sa.Interger, primary_key=True),
			 sa.Column('Parent', sa.Interger),
			 sa.Column('Title', sa.String),
			 sa.Column('Best', sa.DateTime),
			 sa.Column('Is_Best', sa.Boolean),
			 sa.Column('Cache',sa.Text),
			 )


article_revision_table = sa.Table('article_revisions', metadata,
				sa.Column('article_locator_id', sa.Interger),
				sa.Column('Version', sa.DateTime),
				sa.Column('Patch', sa.Test),
				)

article_raw_table = sa.Table('article_raw', metadata,
		       sa.Column('article_locator_id', sa.Interger),
		       sa.Column('raw_text', sa.Text),
		       )

class Article_Locator(object):
	"""
		The Article_Locator object is for use with SQL Alchemy to
		describe the location methods presented here.

		Location items include an ID, a Parent id (to grab 
		subsections to article entries). The articles Title serves 
		as a human readable way to find the article. And will be 
		used in the outputted URLs. Internally links will be stored 
		as the Ids.

		To properly locate this article a Best revision will be used 
		for applications of patches. Changing Best, should have 
		a side effect of toggling Is_Best to false.

		Only when the article is requested, should what is in Cache 
		be updated to the new article, should Is_Best be false. (At
		which point, Is_Best will be toggled).

		Typically RoseBush will not flip Best until that revision is
		approved (unless the queue is turned off)
	"""
	def __init__(self,Parent, Title, Best, Is_Best, Cache):
		self.Parent = Parent
		self.Title = Title
		self.Best = Best
		self.Is_Best = Is_Best
		self.Cache = Cache

	def __repr(self):
		return "<Article_Locator('%s','%s','%s','%s','%s')>" %(self.Parent, self.Title, self.Best, self.Is_Best, self.Cache)


class Article_Revisions(object):
	"""
		This table keeps tracks of patches and revisions to the raw
		articles presented.

		Again, SQL Alchemy stuffs here

		This mostly takes a locator id, the version id (a time stamp),
		and the diff style patch
	"""
	def __init__(self,article_locator_id,version,patch):
		self.article_locator_id = article_locator_id
		self.version = version
		self.patch = patch


	def __repr(self):
		return "<Article_Revisions('%s','%s','%s')>" %(self.article_locator_id, self.version, self.patch)


class Article_Raw(object):
	"""
		Just contains the raw article itself. That is all.

		SQL Alchemy blah

		Oh, right--our locator id is based on the Article Locator scheme
	"""

	def __init__(self,article_locator_id, raw):
		self.article_locator_id = article_locator_id
		self.raw = raw


	def __repr(self):
		return "<Article_Raw('%s','%s')>" %(self.article_locator_id, self.raw)

def add_engine(engine):
	metadata.create_all(engine)


sa.orm.mapper(Article_Locator, article_locator_table)
sa.orm.mapper(Article_Revisions, article_revisions_table)
sa.orm.mapper(Article_Raw, article_raw_table)


if __name__ eq '__main__':
	"""
		standard test unit entry here. Should never be used by
		accident... as an accident kind of requires changing the 
		shebang at the top to a real interpretor
	"""
	engine = sa.create_engine('sql:///:memory:', echo=True);
	add_engine(engine)
