App.Athlete = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  gender: DS.attr('string'),
  status: DS.attr('string'),

  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName')
});

App.Athlete.reopenClass({
  valid: function(fields) {
    return fields.firstName && fields.lastName;
  },
  GENDER_LIST: ['female', 'male'],
  STATUS_LIST: ['active', 'inactive']
});