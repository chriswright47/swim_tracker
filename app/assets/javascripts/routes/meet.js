App.MeetRoute = Ember.Route.extend({
  model: function(params) { return this.store.find('meet', params.id); },
  heats: function(params) { return this.store.find('meet', params.id).get('heats.content'); }
});