function findOutlier(integers) {
    //your code here
    const results = integers.map((number) => {
        if (number % 2 == 0) {
            return { number: number, is_even: true, is_odd: false };
        } else {
            return { number: number, is_even: false, is_odd: true };
        }
    });

    const odds = results.filter((result) => {
        return result.is_even === false;
    });

    const evens = results.filter((result) => {
        return result.is_odd === false;
    });

    if (odds.length == 1) {
        return odds[0].number;
    } else {
        return evens[0].number;
    }
}
