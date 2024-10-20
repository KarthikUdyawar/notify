import pywhatkit as kit
import time
import argparse
import os
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

# Retrieve phone number from environment variable
WHATSAPP_PHONE_NUMBER = os.getenv('WHATSAPP_PHONE_NUMBER')

def send_whatsapp_notification(phone_number, message):
    try:
        # Send a WhatsApp message at the specified time (current time + 1 minute)
        kit.sendwhatmsg(phone_number, message, time.localtime().tm_hour, time.localtime().tm_min + 1, tab_close=True)
        print("WhatsApp Notification sent!")
    except Exception as e:
        print(f"Error sending WhatsApp notification: {e}")

def main():
    parser = argparse.ArgumentParser(description='Send WhatsApp notifications via CLI.')
    parser.add_argument('message', type=str, help='The message to send')
    
    args = parser.parse_args()
    
    send_whatsapp_notification(WHATSAPP_PHONE_NUMBER, args.message)

if __name__ == "__main__":
    main()
