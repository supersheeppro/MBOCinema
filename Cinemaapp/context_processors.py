from .models import StandardEventList

def event_lists(request):
    # Haal alle EventLists op
    event_lists = StandardEventList.objects.all()
    return {'event_lists': event_lists}
