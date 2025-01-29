const t = [1, -1, 3];
console.log(t);

t.push(5);
console.log(t);

console.log(t.length); 
console.log(t[1]);

t.forEach(value => {
    console.log(value);
});

for (let i = 0; i < t.length; i++){
    console.log('Im not using forEach ', t[i]);
};

const t2 = t.concat(5); // creates new array, does not add a new item to the old array

console.log(t); 
console.log(t2); 

const m1 = t.map(value => value * 2); // afecta a todos los valores del array
console.log(m1);

const m2 = t.map( value => '<li>' + value + '<li>');
console.log(m2);

// Individual items can be assign to variables with destructuring assignment.
const [first, second, ...rest] = t

console.log(first, second);
console.log(rest);

// other way to initialize arrays
const newArray = new Array();
console.log(newArray);

// push, pop, shift, unshift
newArray.push(5);
console.log(newArray);

newArray.push(6, 7);
console.log(newArray);

newArray.pop();
console.log(newArray); // remove the last of the array

newArray.shift(); // remove the first element
console.log(newArray);

newArray.push(8, 9);

newArray.unshift(1); // insert the element at the start
console.log(newArray);

const numbers = [4, 9, 16, 25];
const newArr = numbers.map(valor => valor * 2);

console.log(numbers);
console.log(newArr);