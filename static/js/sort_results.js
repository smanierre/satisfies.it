const selector = document.querySelector(".sort-selector")
let listItems = Array.from(document.querySelectorAll(".result-item"))
const listElem = document.querySelector(".results-list")
selector.addEventListener("change", e => {
    sort(e.target.value)
})

function sort(value) {
    switch(value) {
        case "type-name":
            sortByName()
            break
        case "package-name":
            sortByPackage()
            break
        case "base-type":
            sortByBaseType()
            break
    }
    let html = ""
    listItems.forEach(li => html+= li.outerHTML)
    listElem.innerHTML = html
}

function sortByName() {
    listItems = listItems.sort((a, b) => {
        if(a === b) return 0;
        if(a.dataset.name < b.dataset.name) return -1;
        return 1;
    })
}



function sortByPackage() {
    listItems = listItems.sort((a, b) => {
        if(a === b) return 0;
        if(a.dataset.package < b.dataset.package) return -1;
        return 1;
    })
}

function sortByBaseType() {
    listItems = listItems.sort((a, b) => {
        if(a === b) return 0;
        if(a.dataset.basetype < b.dataset.basetype) return -1;
        return 1;
    })
}