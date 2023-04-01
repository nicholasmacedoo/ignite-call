/*
  Warnings:

  - You are about to drop the column `end_start_in_minutes` on the `user_time_intervals` table. All the data in the column will be lost.
  - Added the required column `time_end_in_minutes` to the `user_time_intervals` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_user_time_intervals" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "week_day" INTEGER NOT NULL,
    "time_start_in_minutes" INTEGER NOT NULL,
    "time_end_in_minutes" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,
    CONSTRAINT "user_time_intervals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_user_time_intervals" ("created_at", "id", "time_start_in_minutes", "updated_at", "user_id", "week_day") SELECT "created_at", "id", "time_start_in_minutes", "updated_at", "user_id", "week_day" FROM "user_time_intervals";
DROP TABLE "user_time_intervals";
ALTER TABLE "new_user_time_intervals" RENAME TO "user_time_intervals";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
