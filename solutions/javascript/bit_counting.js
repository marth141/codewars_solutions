var countBits = function (n) {
    return n.toString(2).split("").reduce((accumulator, n) => parseInt(accumulator) + parseInt(n), 0)
};
