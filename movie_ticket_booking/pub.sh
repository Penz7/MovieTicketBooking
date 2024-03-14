
cd ..
cd network
fvm use 3.19.3
fvm flutter pub get

cd ..
cd local_storage
fvm use 3.19.3
fvm flutter pub get

cd ..
cd movie_ticket_booking
fvm use 3.19.3
fvm flutter pub get
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

