// private methods
const indx = Symbol('indx');

class Line {
  constructor() {
    this.members = [];
  }

  join(person) {
    this.members.push(person);
  }

  leave(person) {
    let index = this[indx](person);
    if (index > 0 ) {
      let firstPart = this.members.slice(0, index);
      let remainingPart = this.members.slice(index + 1, this.members.length);

      this.members = [...firstPart, ...remainingPart];
    }
  }

  front() {
    return this.members[0];
  }

  middle() {
    let middle = (this.members.length / 2)
    return this.members[middle];
  }

  back() {
    return this.members[this.members.length - 1];
  }

  search(person) {
    return this.members.find(human => human === person) ? person : null;
  }

  // private methods

  // Returns the location of person in the Line
  [indx](person) {
    // returns -1 if not found
    return this.members.indexOf(person);
  }
}

module.exports = Line;
