import DS from 'ember-data';
import Ember from 'ember';

var Todo = DS.Model.extend({
  title: DS.attr('string'),
  complete: DS.attr('number', { defaultValue: 0 }),

  isComplete: Ember.computed('complete', function() {
    return this.get('complete') === 1;
  })
});

export default Todo;
