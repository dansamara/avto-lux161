# -*- coding: utf-8 -*-

__all__ = ['routes_mixin']

import hashlib

class AuthMixin:
	def create_password(self, symbols):
		return str(hashlib.sha512(symbols.encode('utf-8')).hexdigest())

	def compare_password(self, hpasswd=None, password=None):
		return hpasswd == hashlib.sha512(password.encode('utf-8')).hexdigest()
