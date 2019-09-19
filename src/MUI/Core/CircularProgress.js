exports._CircularProgress = require("@material-ui/core/CircularProgress").default;
exports._eqColorProp = function(left){ return function(right){ return left === right }};
exports._ordColorProp = function(left){ return function(right){ return (left === right) ? 0 : (left > right) ? 1 : -1 }};
exports._eqVariantProp = function(left){ return function(right){ return left === right }};
exports._ordVariantProp = function(left){ return function(right){ return (left === right) ? 0 : (left > right) ? 1 : -1 }};