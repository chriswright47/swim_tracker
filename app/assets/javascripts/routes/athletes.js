App.AthletesRoute = Ember.Route.extend({
  model: function() { return this.store.find('athlete'); }
});