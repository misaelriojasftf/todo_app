/// converts to string
String string(dynamic element) => '$element';

/// converts to num
num number(dynamic element, [num fb = 0]) => num.tryParse('$element') ?? fb;

/// converts to boolean
bool boolean(dynamic element) => element == true;
