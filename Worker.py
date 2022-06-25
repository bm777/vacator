# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Signal, Slot, Property

class Worker(QObject):


    def __init__(self):
        QObject.__init__(self)
        self.str = "Class for Slots"


    @Slot(str, str, result="QVariantList")
    def wdata(self):
        """
        weather data pulled from vacator.vercel.app/
        """
        return [37, 25.4, 0.005]
