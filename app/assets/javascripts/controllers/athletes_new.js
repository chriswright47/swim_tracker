App.AthletesNewController = Ember.Controller.extend({
  actions: {
    createAthlete: function() {
      var self = this;
      var fields = this.get('fields');
      if (App.Athlete.valid(fields)) {
        var athlete = this.store.createRecord('athlete', fields);
        athlete.save().then(function(athlete) {
          self.transitionToRoute('athlete', athlete);
        });
      } else {
        this.set('showError', true);
      }
    }
  }
});