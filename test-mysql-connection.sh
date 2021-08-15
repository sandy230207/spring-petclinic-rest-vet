for i in {1..1000000}
do
    curl "http://127.0.0.1:9967/petclinic/api/vets" &
done