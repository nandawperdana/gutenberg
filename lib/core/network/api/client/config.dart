const maxRetry = 3;
const cacheDuration = 15 * 60; // 15 minutes
const timeOutDuration = Duration(seconds: 30);
const maxPageResults = 32;

const keyRequestConfig = 'request_config';

const keyIsUseCache = 'is_use_cache';
const keyCacheDuration = 'cache_duration';
const keyOverwriteUrl = 'overwrite_url';
