var convert = function (s, numRows) {
  if (numRows === 1 || s.length < numRows) {
    return s;
  }
  let rows = [];
  let currentRow = 0;
  let reverse = false;
  let result = "";

  for (let i = 0; i < numRows; i++) {
    rows[i] = [];
  }

  for (let i = 0; i < s.length; i++) {
    rows[currentRow].push(s[i]);
    if (reverse === false) {
      currentRow++;
    } else {
      currentRow--;
    }

    if (currentRow === numRows - 1 || currentRow === 0) {
      reverse = !reverse;
    }
  }

  rows.forEach((row) => {
    result += row.join("");
  });

  return result;
};

console.log(convert("PAYPALISHIRING", 3));
