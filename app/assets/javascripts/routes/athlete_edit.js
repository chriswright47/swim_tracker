App.AthleteEditRoute = Ember.Route.extend({
  activate: function() {
    this.controllerFor('athlete').set('isEditing', true);
  },

  deactivate: function() {
    this.controllerFor('athlete').set('isEditing', false);
  }
})