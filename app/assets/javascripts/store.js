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