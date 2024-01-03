function inArray(array1, array2) {
    return array1.filter(function (word1) {
        return array2.find(function (word2) {
            return word2.includes(word1)
        }) != undefined
    }).sort()
}
