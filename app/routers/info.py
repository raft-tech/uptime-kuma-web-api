from fastapi import APIRouter, Depends, HTTPException
from uptime_kuma_api import UptimeKumaApi, UptimeKumaException

from config import logger as logging
from schemas.api import API
from utils.deps import get_current_user

router = APIRouter(redirect_slashes=True)


@router.get("", description="Informations")
async def get_info(cur_user: API = Depends(get_current_user)):
    api : UptimeKumaApi = cur_user['api']
    try:
        return api.info()
    except Exception as e:
        logging.fatal(e)
        raise HTTPException(500, str(e))
