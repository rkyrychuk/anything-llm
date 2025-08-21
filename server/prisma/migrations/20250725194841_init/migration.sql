-- CreateTable
CREATE TABLE "desktop_mobile_devices" (
  "id" SERIAL NOT NULL,
  "deviceOs" text NOT NULL,
  "deviceName" text NOT NULL,
  "token" text NOT NULL,
  "approved" boolean NOT NULL DEFAULT false,
  "userId" integer,
  "createdAt" timestamptz NOT NULL DEFAULT now(),
  
  CONSTRAINT "desktop_mobile_devices_pkey" PRIMARY KEY ("id"),
  CONSTRAINT "desktop_mobile_devices_userId_fkey"
    FOREIGN KEY ("userId") REFERENCES "users" ("id")
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex (unique)
CREATE UNIQUE INDEX "desktop_mobile_devices_token_key"
  ON "desktop_mobile_devices" ("token");

-- CreateIndex
CREATE INDEX "desktop_mobile_devices_userId_idx"
  ON "desktop_mobile_devices" ("userId");