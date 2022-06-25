# This Python file uses the following encoding: utf-8
from PySide2.QtCore import QObject, Signal, Slot, Property
import requests

class Worker(QObject):


    def __init__(self):
        QObject.__init__(self)
        self.str = "Class for Slots"
        self.url = "https://vacator.vercel.app/"

    @Slot(str, str, result="QVariantList")
    def wdata(self, town, datetime):
        """
        weather data pulled from vacator.vercel.app/
        """

        url = self.url + town.capitalize() +"/"+ datetime
        re = requests.get(url)
        data = re.json()

        return data["values"]
