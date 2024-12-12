function Object_projection(src, proto) {
    const result = {};
    function traverse(srcObj, protoObj, resObj) {
        for (let key in protoObj) {
            if (protoObj.hasOwnProperty(key) && srcObj.hasOwnProperty(key)) { // key exists in both source and prototype 
                if (protoObj[key] && typeof protoObj[key] === 'object' && protoObj[key] !== null) {
                    resObj[key] = {};    // Initialize the sub-object in result
                    traverse(srcObj[key], protoObj[key], resObj[key]); // Recurse into the nested objects
                } else {
                    resObj[key] = srcObj[key]; //prototype has no nested objects, assign the value from the source
                }
            }
        }
    }

    traverse(src, proto, result);
    return result;
}

const src = {
    prop11: {
        prop21: 21,
        prop22: {
            prop31: 31,
            prop32: 32
        }
    },
    prop12: 12
};

const proto = {
    prop11: {
        prop22: null
    }
};

const projectedObject = Object_projection(src, proto);
console.log(JSON.stringify(projectedObject, null, 2));
