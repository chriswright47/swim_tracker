App.Store = DS.Store.extend({});
// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
App.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',
  headers: Ember.computed(function(){
    var token = Ember.$('meta[name="csrf-token"]').attr('content');

    return {"X-CSRF-Token": token};
  })
});


// Adds X-CSRF-Token to all REST requests.
// Allows for the use of Rails protect_from_forgery
// The CSRF Token is normally found in app/views/layouts/application.html.*
// inserted with the rails helper: "csrf_meta_tags"
// DS.ActiveModelAdapter.reopen({
//   namespace: 'api/v1',
//   headers: {
//     "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
//   }
// });
