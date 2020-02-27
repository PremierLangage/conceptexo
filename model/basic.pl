@ /utils/sandboxio.py
@ /builder/before2.py [builder.py]
@ /grader/evaluator2.py [grader.py]

extracss ==
<style>
.success-state p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    content: "  \f00c";
    vertical-align: middle;
    font-weight: 900;
}

.error-state p::after {
    font-family: "Font Awesome 5 Free";
    color: #721c24;
    content: "  \f00d";
    vertical-align: middle;
    font-weight: 900;
}

.missed-state p::after {
    font-family: "Font Awesome 5 Free";
    color: #155724;
    content: "  \f00c";
    vertical-align: middle;
    font-weight: 900;
}

</style>
==
