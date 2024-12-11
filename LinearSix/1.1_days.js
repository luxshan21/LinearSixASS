Date.prototype.daysTo = function(targetDate) {
    const timeDifference = targetDate.getTime() - this.getTime(); // convert date to milisecond timestamp
    const countDays = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
    return countDays;
};

const d1 = new Date('2024-12-10');
const d2 = new Date('2024-12-15');
console.log(d1.daysTo(d2)); 