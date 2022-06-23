# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtGui import QFontDatabase

CURRENT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    path_font = "Comfortaa/Comfortaa-Regular.ttf"

    font = os.path.join(CURRENT_DIRECTORY, "font", path_font)
    _id = QFontDatabase.addApplicationFont(font)

    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
