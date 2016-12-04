import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'li',
  classNameBindings: ['todo.isComplete:completed', 'isEditing:editing'],

  init() {
    this._super(...arguments);
    this.set('isEditing', false);
  },

  actions: {
    editTodo() {
      this.set('isEditing', true);
    },

    save(title) {
      this.set('isEditing', false);
      let todo = this.get('todo');
      todo.set('title', title);
      todo.save();
    },

    removeTodo() {
      let todo = this.get('todo');
      todo.destroyRecord();
    },

    toggleCompleteTodo() {
      let todo = this.get('todo');
      let newCompletionValue = todo.get('complete') === 0 ? 1 : 0;
      todo.set('complete', newCompletionValue);
      todo.save();
    }
  }
});
