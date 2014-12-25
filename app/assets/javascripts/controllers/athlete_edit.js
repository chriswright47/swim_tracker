App.AthleteEditController = Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      var self = this;
      this.get('model').save().then(function() {
        self.transitionToRoute('athlete');
      });
    },

    cancel: function() {
      this.get('model').rollback();
      this.transitionToRoute('athlete');
    }
  },
});