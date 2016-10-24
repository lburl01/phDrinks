console.log('Devise!');

// include code below on every html page you add js things to
// <% content_for :javascripts do %>
// <%= javascript_include_tag 'devise', 'data-turbolinks-track': 'reload' %>
// <% end %>

// add this to the bottom of the html page
// <%= javascript_include_tag "jquery-3.1.1.min.js" %>

/*! Fades in page on load */
$('body').css('display', 'none');
$('body').fadeIn(2000);
