
import configparser

config = configparser.ConfigParser()		
config.read("config.ini")
login = config['LOGIN']
server = config['SERVER']