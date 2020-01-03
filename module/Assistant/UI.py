
#!/usr/bin/env python3
from socket import AF_INET, socket, SOCK_STREAM
from threading import Thread
import tkinter
import os
import shutil
import re
import time
import speech_recognition as sr
import sounddevice as sd
import soundfile as sf
from random import randint
from time import sleep
import sys
from flask import Flask, render_template, request, redirect, Response
import random, json



#speech recognizer initialize
H = 'Hello'
AUDIO_FILE = "/Assistant/output.wav"
r = sr.Recognizer()
#f = open('/Assistant/recieve.txt','r')
os.system('echo Project MaruchiTarento Developed by questandachievement7 > /Assistant/recieve.txt')
#os.system("'dialog --title $A --msgbox 'Project MaruchiTarento Developed by questandachievement7' 5 50'")
#$ f = open('helloworld.txt','r')
#message = f.read()
#print(message)
#f.close() //
#time.sleep(5)

#f0 = open('/Assistant/memory/badword.txt','r')
#KEYBOARD = raw_input('[User] ').strip()
#badword = f0.read()
badword = ['ngentot', 'kontol', 'fuck', 'goblok', 'bajingan', 'shit', 'hentai', 'fak', 'masturbasi', 'coli', 'Message cannot be sent', 'bitch', 'asshole', 'motherfucker', 'cunt', 'dick']

def receive():
    """Handles receiving of messages."""
    while True:
        try:
            f = open('/Assistant/recieve.txt','r')
            #f = open('/Assistant/execmem/voice.txt','r')
            msg = f.read()
            if ( msg == 'NAN' ):
                time.sleep(1)
                print ("Client> Message Polling")
            else:
                time.sleep(1)
                msg_list.insert(tkinter.END, msg)
                msg_list.see(tkinter.END)
                #f.close()
                #os.system('rm /Assistant/recieve.txt')
                #print('meow')
        except OSError:
            break

def recievevoice():
    while True:
        print("Clientdbg>Start_Voice Recording")
        """"Handles receiving of messages but with voicedata."""
        samplerate = 44100 #Hertz
        duration = 10  # seconds
        #Saves Previous Recorded Voice
        os.system('cp -r /Assistant/output.wav /Assistant/memory/voicedata')
        shutil.move('/Assistant/memory/voicedata/output.wav', '/Assistant/memory/voicedata/' + str(randint(2, 1235115)) + '.wav')
        filename = 'output0.wav'
        mydata = sd.rec(int(samplerate * duration), samplerate=samplerate, channels=2, blocking=True)
        sf.write(filename, mydata, samplerate)
        print("Clientdbg>Stopped_Voice Recording")
        os.system('sox output0.wav -n noiseprof noise.prof >/dev/null 2>&1 ')
        #os.system('sox output0.wav output.wav noisered noise.prof 0.01 >/dev/null 2>&1')
        #os.system('sox output0.wav output.wav noisered noise.prof 0.0 >/dev/null 2>&1')
        os.system('mv /Assistant/output0.wav /Assistant/output.wav')
        with sr.AudioFile(AUDIO_FILE) as source:
            #print("[OrionIntrepeter]Please wait. Calibrating microphone...")
    # listen for 5 seconds and create the ambient noise energy level
            #r.adjust_for_ambient_noise(source, duration=1)
            #print("[OrionIntrepeter]ready to recieve")
            #print("uncomment audio = r to get voice recognition service")
            print("Clientdbg>Input_wait(voice)")
                #print("meong")
            #os.system("play /Assistant/sfx/beep_open.wav >/dev/null 2>&1 &")
            audio = r.record(source)
            #os.system("play /Assistant/sfx/beep_close.wav >/dev/null 2>&1 &")

    # recognize speech using Sphinx
        try:
            #Uncomment H to enable voice recognition mode
            print("Clientdbg>Waiting Intrepeter Engine 1")
            #H = r.recognize_sphinx(audio)
            #print("[OrionEngine1UserIntrepeter[Unusable][local]] '" + H + "'")
            print("Clientdbg>Waiting Intrepeter Engine 1")
            #H = r.recognize_google(audio)
            H = r.recognize_sphinx(audio)
            #print("[OrionEngine2UserIntrepeter[Main_priority][online]] '" + H + "'")
            #H = r.recognize_google(audio)
            print("[User]:" + H )
            msg = H
            B = msg
            #H = KEYBOARD
        except sr.UnknownValueError:
            print("Clientdbg>fixme:error intrepeter")
            #KEYBOARD = raw_input('[User]: ').strip()
            #H = KEYBOARD
            H = H
            #os.system('sox output0.wav output.wav noisered noise.prof 0.1 >/dev/null 2>&1')
            H = r.recognize_sphinx(audio)
            print("[User]:" + H )
            msg = H
            B = msg
        except sr.RequestError as e:
            print("Clientdbg> fallbackMode {0}".format(e))
            #KEYBOARD = raw_input('[User]: ').strip()
            #H = KEYBOARD
            H = H
            #os.system('sox output0.wav output.wav noisered noise.prof 0.1 >/dev/null 2>&1')
            H = r.recognize_sphinx(audio)
            print("[User]:" + H )
            msg = H
            B = msg
        if any(msg.find(s)>=0 for s in badword):
        #if re.search(re.escape(msg), badword, re.I):
        #if re.search(any(msg.find(s)>=0 for s in badword), re.I):
        #elif HLower in swear:
            #os.system("zenity --warning --text='Bad word cannot be tollerated'")
            print ('Clientsideprotection> badword ? or misheard? im sad i cant calculate square root of fish :( )')
            my_msg.set("")
            #time.sleep(3)
            msg_list.insert(tkinter.END,"[ClientUserIntentionAnalyzer]: Unexpected error on analyzing user voice")
            msg_list.see(tkinter.END)
            #my_msg.set("")
        else:
            text_file = open("/Assistant/send.txt", "w")
            text_file.write(B) #tbh i confuse how to integrate it xd
            text_file.close()
            #my_msg.set("")  # Clears input field.
            print ("Clientdbg> User Intention chain:" + msg)
            #msg_list.insert(tkinter.END,"[UserAmbientThought] :" + msg)
            #msg_list.see(tkinter.END)


def send(event=None):  # event is passed by binders.
    msg = my_msg.get()
    if any(msg.find(s)>=0 for s in badword):
    #if re.search(re.escape(msg), badword, re.I):
    #if re.search(any(msg.find(s)>=0 for s in badword), re.I):
    #elif HLower in swear:
        os.system("zenity --warning --text='Bad word cannot be tollerated'")
        print ('Clientsideprotection> badword has been detected and prevented from circulating the net')
        my_msg.set("")
        #time.sleep(3)
        msg_list.insert(tkinter.END,"[Client] : Message cannot be sent please try again")
        msg_list.see(tkinter.END)
        #my_msg.set("")
    else:
        msg = my_msg.get()
        B = msg
        text_file = open("/Assistant/send.txt", "w")
        text_file.write(B) #tbh i confuse how to integrate it xd
        text_file.close()
        my_msg.set("")  # Clears input field.
        msg_list.insert(tkinter.END,"[User] :" + msg)
        msg_list.see(tkinter.END)
        if msg == "bootloader":
            #print('quit')
            os.system("bash /Assistant/bootloader.sh")


def on_closing(event=None):
    """This function is to be called when the window is closed."""
    my_msg.set("To quit Maruchi Tarento you must unload from the bootloader")
    send()

def legacycompability(event=None):
    app = Flask(__name__)

    @app.route('/')
    def output():
    	# serve index template
    	return render_template('index.html', name='Joe')

    @app.route('/receiver', methods = ['POST'])
    def worker():
    	# read json + reply
    	data = request.get_json()
    	result = ''

    	for item in data:
    		# loop over every row
    		result += str(item['make']) + '\n'

    	return result

    if __name__ == '__main__':
    	# run!
    	app.run()

top = tkinter.Tk()
top.title("Project Maruchi Tarento")

messages_frame = tkinter.Frame(top)
my_msg = tkinter.StringVar()  # For the messages to be sent.
my_msg.set("")
scrollbar = tkinter.Scrollbar(messages_frame)  # To see through previous messages.
# this will contain the messages.
msg_list = tkinter.Listbox(messages_frame, height=30, width=120, yscrollcommand=scrollbar.set)
scrollbar.pack(side=tkinter.RIGHT, fill=tkinter.Y)
msg_list.pack(side=tkinter.LEFT, fill=tkinter.BOTH)
msg_list.pack()
messages_frame.pack()

entry_field = tkinter.Entry(top, textvariable=my_msg)
entry_field.bind("<Return>", send)
entry_field.pack()
send_button = tkinter.Button(top, text="Send message", command=send)
send_button.pack()

top.protocol("WM_DELETE_WINDOW", on_closing)

#Socket part
#HOST = input('Enter host: ') # Enter host of the server without inverted commas
#PORT = 33000
#BUFSIZ = 1024
#ADDR = (HOST, PORT)


receive_thread = Thread(target=receive)
receive_thread.start()
voiceinput_thread = Thread(target=recievevoice)
voiceinput_thread.start()
#sent_thread = Thread(target=send)
#sent_thread.start()
#tkinter.mainloop()  # for start of GUI  Interface
