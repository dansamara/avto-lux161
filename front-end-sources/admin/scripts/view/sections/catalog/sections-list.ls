/**
 * Catalog Sections List View
 *
 * @author Viacheslav Lotsmanov
 * @author Andrew Fatkulin
 */

require! {
	\backbone : B
	\marionette : M
	\backbone.wreqr : W
	'../../../ajax-req'

	# views
	'../../smooth' : SmoothView
	'../../loader' : LoaderView
}

class CatalogSectionsListView extends SmoothView
	initialize: !->
		SmoothView.prototype.initialize ...

		@loader-view = (new LoaderView!).render!

	on-show: !->
		@get-region \main .show @loader-view

		#@ajax = ajax-req {
			#data:
				#action: \get_pages_list
			#success: (json)!~>
				#if json.status is not \success or not json.data_list?
					#W.radio.commands .execute \police, \panic,
						#new Error 'Incorrect server data'

				#new-data-list = []
				#for item in json.data_list
					#new-data-list.push {
						#ref: '#panel/pages/edit_' + item.id + '.html'
						#title: item.title
					#}

				#list = new B.Collection new-data-list
				#view = new PagesListView collection: list
				#view.render!
				#@get-region \main .show view
		#}

	regions:
		\main : '.main'

	class-name: 'catalog-sections-list v-stretchy'
	template: 'main'

	on-destroy: !->
		@ajax.abort! if @ajax?

module.exports = CatalogSectionsListView
