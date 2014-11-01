// Superfish Menu


jQuery(document)
	.ready(function() {
	jQuery(window)
		.load(function() {
		jQuery('#slider-wrapper .loading')
			.removeClass('loading');
		jQuery('#slider')
			.css('display', 'block');
		jQuery('#slider .images')
			.animate({
			'opacity': 1
		}, 300);

	})
});

jQuery(document)
	.ready(function() {
	jQuery('.imagesSPAll IMG')
		.css('opacity', 0);
	jQuery('.navigationSP')
		.css('opacity', 0);

	jQuery(window)
		.load(function() {
		jQuery('.imagesSP .loading')
			.removeClass('loading');
		jQuery('.imagesSPAll IMG')
			.animate({
			'opacity': 1
		}, 500, function() {
			jQuery('.navigationSP')
				.animate({
				'opacity': 1
			}, 500);
		});
	})
});



jQuery(document)
	.ready(function() {
	jQuery('#menu-main-menu-1 > li')
		.each(function(index) {
		if (jQuery(this)
			.find('ul')
			.size() > 0) {
			jQuery(this)
				.addClass('has-sub-menu');
		}
	});

});

jQuery(document)
	.ready(function() {
	jQuery('ul.menu > li')
		.hover(function() {
		jQuery(this)
			.find('ul')
			.stop(true, true)
			.fadeIn(300);

	},

	function() {
		jQuery(this)
			.find('ul')
			.stop(true, true)
			.fadeOut(300);
	});

});

function gotosite(sel) {
	var URL = sel.options[sel.selectedIndex].value;
	window.location.href = URL;
}


/*to top*/

jQuery(document)
	.ready(function($) {
	$(".totop ")
		.hide();

});

jQuery(window)
	.bind('scroll', function() {
	if (jQuery(this)
		.scrollTop() > 200) jQuery(".totop ")
		.fadeIn(200);
	else jQuery(".totop ")
		.fadeOut(200);
});

/*browserfix*/

jQuery(document)
	.ready(function() {
	if (jQuery.browser.opera) {
		jQuery('#headerwrap')
			.css('top', '0');
		jQuery('#wpadminbar')
			.css('display', 'none');
		jQuery('.homeRacent .productR .recentdescription .onsale')
			.css('line-height', '1px');

	}
	if (jQuery.browser.msie && jQuery.browser.version.substr(0, 1) < 9) {
		jQuery('.cartTopDetails')
			.css('border', '1px solid #eee');
		jQuery('#headerwrap')
			.css('border-bottom', '1px solid #ddd');

	}
});


jQuery(document)
	.ready(function() {
	jQuery(function() {
		jQuery(".accordion")
			.accordion({
			autoHeight: false,
			navigation: true
		});
	});
	jQuery(function() {
		jQuery(".progressbar")
			.progressbar();
	});

});



jQuery(document)
	.ready(function() {
	jQuery('.image')
		.each(function(index, el) {

		//find this link's child image element
		var img = jQuery(this)
			.find('img');
		var loading = jQuery(this)
			.children('div');
		//hide the image and attach the load event handler
		jQuery('.overlink')
			.hide();
		jQuery('.overgallery')
			.hide();
		jQuery('.overvideo')
			.hide();
		jQuery('.overdefult')
			.hide();
		jQuery('.overport')
			.hide();

		jQuery(img)
			.hide();

	});
	jQuery(window)
		.load(function() {
		//remove the link's "loading" classname
		//loading.removeClass('loading');
		jQuery('.one_half')
			.find('.loading')
			.attr('class', '');
		jQuery('.one_third')
			.find('.loading')
			.attr('class', '');
		jQuery('.item')
			.find('.loading')
			.attr('class', '');
		jQuery('.item4')
			.find('.loading')
			.attr('class', '');
		jQuery('.item3')
			.find('.loading')
			.attr('class', '');
		jQuery('.image')
			.css('background', 'none');
		jQuery('.recentimage')
			.css('background', 'none');

		//show the loaded image
		jQuery('img')
			.show();

		jQuery('.overlink')
			.show();
		jQuery('.overgallery')
			.show();
		jQuery('.overvideo')
			.show();
		jQuery('.overdefult')
			.show();
		jQuery('.overport')
			.show();
	})
});



jQuery(document)
	.ready(function() {
	jQuery('.blogpostcategory')
		.each(function(index, el) {

		//find this link's child image element
		var iframe = jQuery(this)
			.find('iframe');
		var loading = jQuery(this)
			.children('div');
		//hide the image and attach the load event handler
		jQuery(iframe)
			.hide();
		jQuery(window)
			.load(function() {

			//remove the link's "loading" classname
			loading.removeClass('loading');

			//show the loaded image
			jQuery(iframe)
				.fadeIn();
		})
	});
});




jQuery(document)
	.ready(function() {

	jQuery(".toggle_container")
		.hide();

	jQuery("h2.trigger")
		.click(function() {
		jQuery(this)
			.toggleClass("active")
			.next()
			.slideToggle("slow");
	});
});

jQuery(document)
	.ready(function() {
	jQuery(function() {
		jQuery(".tabwrap")
			.tabs();
		//jQuery(".woocommerce_tabs").tabs({ active: -1 });
	});
});

jQuery(document)
	.ready(function() {
	jQuery('.gototop')
		.click(function() {
		jQuery('html, body')
			.animate({
			scrollTop: 0
		}, 'medium');
	});
});

function loadprety() {
	jQuery(".gallery a")
		.attr("rel", "lightbox[gallery]")
		.prettyPhoto({
		theme: 'light_rounded',
		overlay_gallery: false,
		show_title: false
	});
}

jQuery(function() {
	jQuery("ul#ticker01")
		.liScroll();
});

jQuery(document)
	.ready(function() {
	jQuery('.add_to_cart_button.product_type_simple')
		.live('click', function() {
		jQuery(this)
			.parents(".product")
			.children(".process")
			.children(".loading")
			.css("display", "block");
		jQuery(this)
			.parents(".product")
			.children(".thumb")
			.children("img")
			.css("opacity", "0.1");


	});

	jQuery('body')
		.bind('added_to_cart', function() {
		jQuery(".product .loading")
			.css("display", "none");

		//$(".product .added").parents(".product").children(".process").children(".added-btn").css("display", "block").delay(500).fadeOut('slow');

		jQuery(".product .added")
			.parents(".product")
			.children(".thumb")
			.children("img")
			.delay(600)
			.animate({
			"opacity": "1"
		});

		return false;
	});
});

jQuery(document)
	.ready(function($) {

	// Ajax add to cart
	$('.add_to_cart_button')
		.live('click', function() {

		// AJAX add to cart request
		var $thisbutton = $(this);
		var fragments = '';
		var cart_hash = '';
		if ($thisbutton.is('.product_type_simple, .product_type_downloadable, .product_type_virtual')) {

			if (!$thisbutton.attr('data-product_id')) return true;

			$thisbutton.removeClass('added');
			$thisbutton.addClass('loading');

			var data = {
				action: 'woocommerce_add_to_cart',
				product_id: $thisbutton.attr('data-product_id'),
				quantity: $thisbutton.attr('data-quantity'),
				security: woocommerce_params.add_to_cart_nonce
			};

			// Trigger event
			$('body')
				.trigger('adding_to_cart', [$thisbutton, data]);

			// Ajax action
			$.post(woocommerce_params.ajax_url, data, function(response) {

				if (!response) return;

				var this_page = window.location.toString();

				this_page = this_page.replace('add-to-cart', 'added-to-cart');

				$thisbutton.removeClass('loading');

				if (response.error && response.product_url) {
					window.location = response.product_url;
					return;
				}

				fragments = response.fragments;
				cart_hash = response.cart_hash;

				// Block fragments class
				if (fragments) {
					$.each(fragments, function(key, value) {
						$(key)
							.addClass('updating');
					});
				}

				// Block widgets and fragments
				$('.shop_table.cart, .updating, .cart_totals,.widget_shopping_cart_top')
					.fadeTo('400', '0.6')
					.block({
					message: null,
					overlayCSS: {
						background: 'transparent url(' + woocommerce_params.ajax_loader_url + ') no-repeat center',
						backgroundSize: '16px 16px',
						opacity: 0.6
					}
				});

				// Changes button classes
				if ($thisbutton.parent()
					.find('.added_to_cart')
					.size() == 0) $thisbutton.addClass('added')
					.after(' <a href="' + woocommerce_params.cart_url + '" class="added_to_cart" title="' + woocommerce_params.i18n_view_cart + '">' + woocommerce_params.i18n_view_cart + '</a>');

				// Replace fragments
				if (fragments) {
					$.each(fragments, function(key, value) {
						$(key)
							.replaceWith(value);
					});
				}

				// Unblock
				$('.widget_shopping_cart, .updating, .widget_shopping_cart_top')
					.stop(true)
					.css('opacity', '1')
					.unblock();

				// Cart page elements
				$('.widget_shopping_cart_top')
					.load(this_page + ' .widget_shopping_cart_top:eq(0) > *', function() {

					$("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)")
						.addClass('buttons_added')
						.append('<input type="button" value="+" id="add1" class="plus" />')
						.prepend('<input type="button" value="-" id="minus1" class="minus" />');

					$('.widget_shopping_cart_top')
						.stop(true)
						.css('opacity', '1')
						.unblock();

					$('body')
						.trigger('cart_page_refreshed');
				});

				// Cart page elements
				$('.shop_table.cart')
					.load(this_page + ' .shop_table.cart:eq(0) > *', function() {

					$("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)")
						.addClass('buttons_added')
						.append('<input type="button" value="+" id="add1" class="plus" />')
						.prepend('<input type="button" value="-" id="minus1" class="minus" />');

					$('.shop_table.cart')
						.stop(true)
						.css('opacity', '1')
						.unblock();

					$('body')
						.trigger('cart_page_refreshed');
				});

				$('.cart_totals')
					.load(this_page + ' .cart_totals:eq(0) > *', function() {
					$('.cart_totals')
						.stop(true)
						.css('opacity', '1')
						.unblock();
				});

				// Trigger event so themes can refresh other areas
				$('body')
					.trigger('added_to_cart', [fragments, cart_hash]);
			});

			return false;

		} else {
			return true;
		}

	});

	$('form.subscribe')
		.bind('submit', function() {
		var filter = /^[a-zA-Z0-9]+[a-zA-Z0-9_.-]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{2,4}$/;
		var a = $('form.subscribe input[name="email"]')
			.val();
		if (filter.test(a)) {
			$.ajax({
				url: '/wp-content/themes/mercor/FAS/cstm_fncts.php',
				type: 'POST',
				data: {
					'subscribe': 'novo',
					'email': $('form.subscribe input[name="email"]')
						.val()
				},
				complete: function() {
					$('form.subscribe input[name="email"]')
						.val('');
					alert('Thank you for subscribing!');
				}
			});
		} else {
			$('form.subscribe input[name="email"]')
				.focus();
			alert('Please enter a valid email address');
		}

		return false;
	});


	///// ABOUT GALLERY

	$('#big_img')
		.on({
		load: function(e) {
			var e_h = e.target.offsetHeight;
			var p_h = e.target.parentNode.offsetHeight;
			e.target.style['margin-top'] = p_h / 2 - e_h / 2 + 'px';
		}
	});

	var gallery_index = 0;
	$('.thumb.one_sixth a')
		.each(function(i, v) {
		$(v)
			.data('g_i', i);
	});
	$('.thumb.one_sixth a')
		.click(function() {
		_this = $(this);

		gallery_index = $(this)
			.data('g_i');
		$('#big_img')
			.attr('src', _this.data('full'));

		$('.big_img p')
			.text(_this.data('caption'));

		return false;
	});
	$('.previous_gallery')
		.click(function() {
		gallery_index--;
		if (gallery_index < 0) {
			gallery_index = $('.thumb.one_sixth a')
				.length - 1;
		}
		$('#big_img')
			.attr('src', $('.thumb.one_sixth a')
			.eq(gallery_index)
			.data('full'));

		$('.big_img p')
			.text($('.thumb.one_sixth a')
			.eq(gallery_index)
			.data('caption'));
	});

	$('.next_gallery')
		.click(function() {
		gallery_index++;
		if (gallery_index > $('.thumb.one_sixth a')
			.length - 1) {
			gallery_index = 0;
		}
		$('#big_img')
			.attr('src', $('.thumb.one_sixth a')
			.eq(gallery_index)
			.data('full'));
		$('.big_img p')
			.text($('.thumb.one_sixth a')
			.eq(gallery_index)
			.data('caption'));
	});

	$('#big_img')
		.attr('src', $('.thumb.one_sixth a')
		.eq(gallery_index)
		.data('full'));

	$('.big_img p')
		.text($('.thumb.one_sixth a')
		.eq(gallery_index)
		.data('caption'));



	///// CONTACT MAP

	if ($('.map-container')
		.length) {
		var addresses = [],
			locs = [],
			geocoder,
			map_options = {},
			map,
			i = 0;


		$('.one_third div.contact')
			.each(function() {
			var h = $('.description', this)
				.eq(0)
				.html();
			h = h.replace(/	/g, '')
				.replace(/<br>/g, '')
				.replace(/(\r\n|\n|\r)/gm, ' ');
			addresses.push(h);
		});

		function make_map() {
			map_options = {
				center: locs[0].geometry.location,
				zoom: 12,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			var m = $('.map-container');
			m = m[0];
			map = new google.maps.Map(m, map_options);

			for (var n = 0; n < locs.length; n++) {
				var marker = new google.maps.Marker({
					position: locs[n].geometry.location,
					map: map,
				});
			}
		}

		function make_link_bindings() {
			$('.one_third div.contact')
				.each(function(i) {
				$('.blue_button', this)
					.attr('data-map', i);
				$('.blue_button', this)
					.click(function() {
					var _this = this;
					$('html, body')
						.animate({
						scrollTop: $('.pagewrap')
							.height()
					}, 500, function() {
						map.panTo(locs[$(_this)
							.data('map')].geometry.location);
					});

					return false;
				})
			});
		}

		function get_geocode() {
			if (addresses.length != locs.length) {
				geocoder.geocode({
					'address': addresses[i]
				}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						locs.push(results[0]);
						i++;
						get_geocode();
					}
				});
			} else {
				make_map();
				// make_link_bindings();
			}
		}

		function initialize() {
			geocoder = new google.maps.Geocoder();
			get_geocode();
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	}

});
