$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))

require 'watir'
require 'test/unit'
require 'page-object'
require 'require_all'
require_all 'lib'

World(PageObject::PageFactory)