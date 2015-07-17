var flaURI = 'file:///d|/projects/flash/farm/fla/';

compile('farm');
compile('chicken');
compile('cow');
compile('empty');
compile('wheat');
fl.quit(false);

function compile(fileName) {
    var doc = fl.openDocument(flaURI + fileName + '.fla');
    doc.publish();
    fl.outputPanel.trace("doc.publish");

    fl.closeDocument(fl.documents[0], false); // close without saving
}
