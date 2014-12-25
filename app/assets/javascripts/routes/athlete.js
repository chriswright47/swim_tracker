App.AthleteRoute = Ember.Route.extend({
  model: function(params) { return this.store.find('athlete', params.id); }
});