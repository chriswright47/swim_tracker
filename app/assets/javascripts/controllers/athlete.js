App.AthleteController = Ember.ObjectController.extend({

  isEditing: false,

  delete: function() {
    var self = this;
    this.get('model').destroyRecord().then(function() {
      self.transitionToRoute('athletes');
    });
  }
})