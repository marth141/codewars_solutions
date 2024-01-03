function duplicateCount(text) {
    const lower_case = text.toLowerCase();
    const graphemes = lower_case.split("");
    const frequencies = getFrequency(graphemes);
    const frequency_keys = Object.keys(frequencies)
    var greater_frequencies = {};
    frequency_keys.forEach((key) => {
        if (frequencies[key] > 1) {
            greater_frequencies[key] = frequencies[key];
        }
    })
    return Object.keys(greater_frequencies).length
}

function getFrequency(list) {
    var freq = {};
    list.forEach((el) => {
        if (freq[el]) {
            freq[el]++;
        } else {
            freq[el] = 1;
        }
    })
    return freq;
}
