@import ch.heigvd.dai.controller.*
@import ch.heigvd.dai.model.*
@param Events events

<script>
    function getData() {
        const url = "http://localhost:7000/api/events";
        try {
            fetch(url);
        } catch (error) {
            console.error(error.message);
        }
    }
    getData()
</script>

@for(Event event : events.events)
    <li>${event.toString()}</li>
@else
    NOOOOO
@endfor